(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v8 ?v11)
             (pred_5 ?v9 ?v13)
             (pred_7 ?v8 ?v13)
             (pred_10 ?v12 ?v8 )
	     (pred_8 ?v8)
             (pred_6 ?v4)
             (pred_4 ?v9)
             (pred_1 ?v13)
             (pred_11 ?v8)
             (pred_2 ?v9)
             (pred_12 ?v8)
             (pred_9 ))



(:action op_4
:parameters (?v1 ?v10 ?v5 ?v6)
:precondition (and (pred_6 ?v1) (pred_6 ?v10) (pred_4 ?v5) (pred_1 ?v6)
          (pred_3 ?v1 ?v10) (pred_5 ?v5 ?v6)
                   (pred_7 ?v10 ?v6) (pred_8 ?v1) 
                   (pred_11 ?v10) (pred_2 ?v5))
:effect (and  (pred_12 ?v10) (not (pred_11 ?v10))))


(:action op_1
:parameters (?v1 ?v7)
:precondition (and (pred_6 ?v1) (pred_6 ?v7)
               (pred_8 ?v1) (pred_3 ?v1 ?v7) (pred_12 ?v7))
:effect (and (pred_8 ?v7) (not (pred_8 ?v1))))

(:action op_3
:parameters (?v1 ?v5)
:precondition (and (pred_6 ?v1) (pred_4 ?v5) 
                  (pred_8 ?v1) (pred_10 ?v5 ?v1) (pred_9 ))
:effect (and (pred_2 ?v5)
   (not (pred_10 ?v5 ?v1)) (not (pred_9 ))))


(:action op_2
:parameters (?v1 ?v2 ?v3)
:precondition (and (pred_6 ?v1) (pred_4 ?v2) (pred_4 ?v3)
                  (pred_8 ?v1) (pred_2 ?v3) (pred_10 ?v2 ?v1))
:effect (and (pred_2 ?v2) (pred_10 ?v3 ?v1)
        (not (pred_2 ?v3)) (not (pred_10 ?v2 ?v1))))

(:action op_5
:parameters (?v1 ?v5)
:precondition (and (pred_6 ?v1) (pred_4 ?v5) 
                  (pred_8 ?v1) (pred_2 ?v5))
:effect (and (pred_9 ) (pred_10 ?v5 ?v1) (not (pred_2 ?v5)))))


	
