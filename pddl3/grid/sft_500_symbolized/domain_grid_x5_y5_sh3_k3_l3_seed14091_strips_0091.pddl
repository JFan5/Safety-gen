(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v13 ?v5)
             (pred_3 ?v4 ?v2)
             (pred_4 ?v13 ?v2)
             (pred_7 ?v11 ?v13 )
	     (pred_12 ?v13)
             (pred_8 ?v10)
             (pred_5 ?v4)
             (pred_1 ?v2)
             (pred_10 ?v13)
             (pred_11 ?v4)
             (pred_6 ?v13)
             (pred_9 ))



(:action op_2
:parameters (?v3 ?v7 ?v8 ?v9)
:precondition (and (pred_8 ?v3) (pred_8 ?v7) (pred_5 ?v8) (pred_1 ?v9)
          (pred_2 ?v3 ?v7) (pred_3 ?v8 ?v9)
                   (pred_4 ?v7 ?v9) (pred_12 ?v3) 
                   (pred_10 ?v7) (pred_11 ?v8))
:effect (and  (pred_6 ?v7) (not (pred_10 ?v7))))


(:action op_1
:parameters (?v3 ?v1)
:precondition (and (pred_8 ?v3) (pred_8 ?v1)
               (pred_12 ?v3) (pred_2 ?v3 ?v1) (pred_6 ?v1))
:effect (and (pred_12 ?v1) (not (pred_12 ?v3))))

(:action op_3
:parameters (?v3 ?v8)
:precondition (and (pred_8 ?v3) (pred_5 ?v8) 
                  (pred_12 ?v3) (pred_7 ?v8 ?v3) (pred_9 ))
:effect (and (pred_11 ?v8)
   (not (pred_7 ?v8 ?v3)) (not (pred_9 ))))


(:action op_4
:parameters (?v3 ?v6 ?v12)
:precondition (and (pred_8 ?v3) (pred_5 ?v6) (pred_5 ?v12)
                  (pred_12 ?v3) (pred_11 ?v12) (pred_7 ?v6 ?v3))
:effect (and (pred_11 ?v6) (pred_7 ?v12 ?v3)
        (not (pred_11 ?v12)) (not (pred_7 ?v6 ?v3))))

(:action op_5
:parameters (?v3 ?v8)
:precondition (and (pred_8 ?v3) (pred_5 ?v8) 
                  (pred_12 ?v3) (pred_11 ?v8))
:effect (and (pred_9 ) (pred_7 ?v8 ?v3) (not (pred_11 ?v8)))))


	
