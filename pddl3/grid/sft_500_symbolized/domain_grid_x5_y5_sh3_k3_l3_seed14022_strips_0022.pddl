(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v9 ?v11)
             (pred_7 ?v6 ?v8)
             (pred_4 ?v9 ?v8)
             (pred_1 ?v2 ?v9 )
	     (pred_2 ?v9)
             (pred_5 ?v4)
             (pred_6 ?v6)
             (pred_11 ?v8)
             (pred_3 ?v9)
             (pred_12 ?v6)
             (pred_8 ?v9)
             (pred_10 ))



(:action op_2
:parameters (?v5 ?v12 ?v3 ?v10)
:precondition (and (pred_5 ?v5) (pred_5 ?v12) (pred_6 ?v3) (pred_11 ?v10)
          (pred_9 ?v5 ?v12) (pred_7 ?v3 ?v10)
                   (pred_4 ?v12 ?v10) (pred_2 ?v5) 
                   (pred_3 ?v12) (pred_12 ?v3))
:effect (and  (pred_8 ?v12) (not (pred_3 ?v12))))


(:action op_4
:parameters (?v5 ?v13)
:precondition (and (pred_5 ?v5) (pred_5 ?v13)
               (pred_2 ?v5) (pred_9 ?v5 ?v13) (pred_8 ?v13))
:effect (and (pred_2 ?v13) (not (pred_2 ?v5))))

(:action op_3
:parameters (?v5 ?v3)
:precondition (and (pred_5 ?v5) (pred_6 ?v3) 
                  (pred_2 ?v5) (pred_1 ?v3 ?v5) (pred_10 ))
:effect (and (pred_12 ?v3)
   (not (pred_1 ?v3 ?v5)) (not (pred_10 ))))


(:action op_5
:parameters (?v5 ?v7 ?v1)
:precondition (and (pred_5 ?v5) (pred_6 ?v7) (pred_6 ?v1)
                  (pred_2 ?v5) (pred_12 ?v1) (pred_1 ?v7 ?v5))
:effect (and (pred_12 ?v7) (pred_1 ?v1 ?v5)
        (not (pred_12 ?v1)) (not (pred_1 ?v7 ?v5))))

(:action op_1
:parameters (?v5 ?v3)
:precondition (and (pred_5 ?v5) (pred_6 ?v3) 
                  (pred_2 ?v5) (pred_12 ?v3))
:effect (and (pred_10 ) (pred_1 ?v3 ?v5) (not (pred_12 ?v3)))))


	
