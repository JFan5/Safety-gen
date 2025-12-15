(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v6 ?v5)
             (pred_2 ?v13 ?v10)
             (pred_6 ?v6 ?v10)
             (pred_1 ?v2 ?v6 )
	     (pred_3 ?v6)
             (pred_9 ?v8)
             (pred_10 ?v13)
             (pred_11 ?v10)
             (pred_5 ?v6)
             (pred_4 ?v13)
             (pred_12 ?v6)
             (pred_7 ))



(:action op_4
:parameters (?v3 ?v7 ?v9 ?v11)
:precondition (and (pred_9 ?v3) (pred_9 ?v7) (pred_10 ?v9) (pred_11 ?v11)
          (pred_8 ?v3 ?v7) (pred_2 ?v9 ?v11)
                   (pred_6 ?v7 ?v11) (pred_3 ?v3) 
                   (pred_5 ?v7) (pred_4 ?v9))
:effect (and  (pred_12 ?v7) (not (pred_5 ?v7))))


(:action op_2
:parameters (?v3 ?v1)
:precondition (and (pred_9 ?v3) (pred_9 ?v1)
               (pred_3 ?v3) (pred_8 ?v3 ?v1) (pred_12 ?v1))
:effect (and (pred_3 ?v1) (not (pred_3 ?v3))))

(:action op_1
:parameters (?v3 ?v9)
:precondition (and (pred_9 ?v3) (pred_10 ?v9) 
                  (pred_3 ?v3) (pred_1 ?v9 ?v3) (pred_7 ))
:effect (and (pred_4 ?v9)
   (not (pred_1 ?v9 ?v3)) (not (pred_7 ))))


(:action op_5
:parameters (?v3 ?v4 ?v12)
:precondition (and (pred_9 ?v3) (pred_10 ?v4) (pred_10 ?v12)
                  (pred_3 ?v3) (pred_4 ?v12) (pred_1 ?v4 ?v3))
:effect (and (pred_4 ?v4) (pred_1 ?v12 ?v3)
        (not (pred_4 ?v12)) (not (pred_1 ?v4 ?v3))))

(:action op_3
:parameters (?v3 ?v9)
:precondition (and (pred_9 ?v3) (pred_10 ?v9) 
                  (pred_3 ?v3) (pred_4 ?v9))
:effect (and (pred_7 ) (pred_1 ?v9 ?v3) (not (pred_4 ?v9)))))


	
