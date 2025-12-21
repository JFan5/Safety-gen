(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v13 ?v2)
             (pred_5 ?v4 ?v7)
             (pred_6 ?v13 ?v7)
             (pred_11 ?v10 ?v13 )
	     (pred_4 ?v13)
             (pred_2 ?v3)
             (pred_8 ?v4)
             (pred_9 ?v7)
             (pred_12 ?v13)
             (pred_1 ?v4)
             (pred_3 ?v13)
             (pred_7 ))



(:action op_2
:parameters (?v5 ?v12 ?v1 ?v9)
:precondition (and (pred_2 ?v5) (pred_2 ?v12) (pred_8 ?v1) (pred_9 ?v9)
          (pred_10 ?v5 ?v12) (pred_5 ?v1 ?v9)
                   (pred_6 ?v12 ?v9) (pred_4 ?v5) 
                   (pred_12 ?v12) (pred_1 ?v1))
:effect (and  (pred_3 ?v12) (not (pred_12 ?v12))))


(:action op_4
:parameters (?v5 ?v11)
:precondition (and (pred_2 ?v5) (pred_2 ?v11)
               (pred_4 ?v5) (pred_10 ?v5 ?v11) (pred_3 ?v11))
:effect (and (pred_4 ?v11) (not (pred_4 ?v5))))

(:action op_1
:parameters (?v5 ?v1)
:precondition (and (pred_2 ?v5) (pred_8 ?v1) 
                  (pred_4 ?v5) (pred_11 ?v1 ?v5) (pred_7 ))
:effect (and (pred_1 ?v1)
   (not (pred_11 ?v1 ?v5)) (not (pred_7 ))))


(:action op_5
:parameters (?v5 ?v6 ?v8)
:precondition (and (pred_2 ?v5) (pred_8 ?v6) (pred_8 ?v8)
                  (pred_4 ?v5) (pred_1 ?v8) (pred_11 ?v6 ?v5))
:effect (and (pred_1 ?v6) (pred_11 ?v8 ?v5)
        (not (pred_1 ?v8)) (not (pred_11 ?v6 ?v5))))

(:action op_3
:parameters (?v5 ?v1)
:precondition (and (pred_2 ?v5) (pred_8 ?v1) 
                  (pred_4 ?v5) (pred_1 ?v1))
:effect (and (pred_7 ) (pred_11 ?v1 ?v5) (not (pred_1 ?v1)))))


	
