(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v5 ?v6)
             (pred_1 ?v1 ?v2)
             (pred_4 ?v5 ?v2)
             (pred_12 ?v10 ?v5 )
	     (pred_7 ?v5)
             (pred_8 ?v11)
             (pred_9 ?v1)
             (pred_11 ?v2)
             (pred_10 ?v5)
             (pred_2 ?v1)
             (pred_6 ?v5)
             (pred_5 ))



(:action op_5
:parameters (?v3 ?v7 ?v9 ?v13)
:precondition (and (pred_8 ?v3) (pred_8 ?v7) (pred_9 ?v9) (pred_11 ?v13)
          (pred_3 ?v3 ?v7) (pred_1 ?v9 ?v13)
                   (pred_4 ?v7 ?v13) (pred_7 ?v3) 
                   (pred_10 ?v7) (pred_2 ?v9))
:effect (and  (pred_6 ?v7) (not (pred_10 ?v7))))


(:action op_4
:parameters (?v3 ?v12)
:precondition (and (pred_8 ?v3) (pred_8 ?v12)
               (pred_7 ?v3) (pred_3 ?v3 ?v12) (pred_6 ?v12))
:effect (and (pred_7 ?v12) (not (pred_7 ?v3))))

(:action op_2
:parameters (?v3 ?v9)
:precondition (and (pred_8 ?v3) (pred_9 ?v9) 
                  (pred_7 ?v3) (pred_12 ?v9 ?v3) (pred_5 ))
:effect (and (pred_2 ?v9)
   (not (pred_12 ?v9 ?v3)) (not (pred_5 ))))


(:action op_3
:parameters (?v3 ?v8 ?v4)
:precondition (and (pred_8 ?v3) (pred_9 ?v8) (pred_9 ?v4)
                  (pred_7 ?v3) (pred_2 ?v4) (pred_12 ?v8 ?v3))
:effect (and (pred_2 ?v8) (pred_12 ?v4 ?v3)
        (not (pred_2 ?v4)) (not (pred_12 ?v8 ?v3))))

(:action op_1
:parameters (?v3 ?v9)
:precondition (and (pred_8 ?v3) (pred_9 ?v9) 
                  (pred_7 ?v3) (pred_2 ?v9))
:effect (and (pred_5 ) (pred_12 ?v9 ?v3) (not (pred_2 ?v9)))))


	
