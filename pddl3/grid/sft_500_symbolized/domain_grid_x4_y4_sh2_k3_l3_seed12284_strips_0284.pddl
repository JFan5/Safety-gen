(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v11 ?v4)
             (pred_2 ?v13 ?v9)
             (pred_10 ?v11 ?v9)
             (pred_9 ?v2 ?v11 )
	     (pred_5 ?v11)
             (pred_4 ?v6)
             (pred_1 ?v13)
             (pred_12 ?v9)
             (pred_7 ?v11)
             (pred_3 ?v13)
             (pred_6 ?v11)
             (pred_8 ))



(:action op_5
:parameters (?v3 ?v5 ?v10 ?v1)
:precondition (and (pred_4 ?v3) (pred_4 ?v5) (pred_1 ?v10) (pred_12 ?v1)
          (pred_11 ?v3 ?v5) (pred_2 ?v10 ?v1)
                   (pred_10 ?v5 ?v1) (pred_5 ?v3) 
                   (pred_7 ?v5) (pred_3 ?v10))
:effect (and  (pred_6 ?v5) (not (pred_7 ?v5))))


(:action op_4
:parameters (?v3 ?v8)
:precondition (and (pred_4 ?v3) (pred_4 ?v8)
               (pred_5 ?v3) (pred_11 ?v3 ?v8) (pred_6 ?v8))
:effect (and (pred_5 ?v8) (not (pred_5 ?v3))))

(:action op_3
:parameters (?v3 ?v10)
:precondition (and (pred_4 ?v3) (pred_1 ?v10) 
                  (pred_5 ?v3) (pred_9 ?v10 ?v3) (pred_8 ))
:effect (and (pred_3 ?v10)
   (not (pred_9 ?v10 ?v3)) (not (pred_8 ))))


(:action op_2
:parameters (?v3 ?v7 ?v12)
:precondition (and (pred_4 ?v3) (pred_1 ?v7) (pred_1 ?v12)
                  (pred_5 ?v3) (pred_3 ?v12) (pred_9 ?v7 ?v3))
:effect (and (pred_3 ?v7) (pred_9 ?v12 ?v3)
        (not (pred_3 ?v12)) (not (pred_9 ?v7 ?v3))))

(:action op_1
:parameters (?v3 ?v10)
:precondition (and (pred_4 ?v3) (pred_1 ?v10) 
                  (pred_5 ?v3) (pred_3 ?v10))
:effect (and (pred_8 ) (pred_9 ?v10 ?v3) (not (pred_3 ?v10)))))


	
