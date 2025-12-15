(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v13 ?v3)
             (pred_2 ?v5 ?v4)
             (pred_5 ?v13 ?v4)
             (pred_10 ?v10 ?v13 )
	     (pred_11 ?v13)
             (pred_4 ?v12)
             (pred_12 ?v5)
             (pred_3 ?v4)
             (pred_9 ?v13)
             (pred_7 ?v5)
             (pred_8 ?v13)
             (pred_1 ))



(:action op_2
:parameters (?v1 ?v6 ?v9 ?v11)
:precondition (and (pred_4 ?v1) (pred_4 ?v6) (pred_12 ?v9) (pred_3 ?v11)
          (pred_6 ?v1 ?v6) (pred_2 ?v9 ?v11)
                   (pred_5 ?v6 ?v11) (pred_11 ?v1) 
                   (pred_9 ?v6) (pred_7 ?v9))
:effect (and  (pred_8 ?v6) (not (pred_9 ?v6))))


(:action op_1
:parameters (?v1 ?v8)
:precondition (and (pred_4 ?v1) (pred_4 ?v8)
               (pred_11 ?v1) (pred_6 ?v1 ?v8) (pred_8 ?v8))
:effect (and (pred_11 ?v8) (not (pred_11 ?v1))))

(:action op_4
:parameters (?v1 ?v9)
:precondition (and (pred_4 ?v1) (pred_12 ?v9) 
                  (pred_11 ?v1) (pred_10 ?v9 ?v1) (pred_1 ))
:effect (and (pred_7 ?v9)
   (not (pred_10 ?v9 ?v1)) (not (pred_1 ))))


(:action op_3
:parameters (?v1 ?v7 ?v2)
:precondition (and (pred_4 ?v1) (pred_12 ?v7) (pred_12 ?v2)
                  (pred_11 ?v1) (pred_7 ?v2) (pred_10 ?v7 ?v1))
:effect (and (pred_7 ?v7) (pred_10 ?v2 ?v1)
        (not (pred_7 ?v2)) (not (pred_10 ?v7 ?v1))))

(:action op_5
:parameters (?v1 ?v9)
:precondition (and (pred_4 ?v1) (pred_12 ?v9) 
                  (pred_11 ?v1) (pred_7 ?v9))
:effect (and (pred_1 ) (pred_10 ?v9 ?v1) (not (pred_7 ?v9)))))


	
