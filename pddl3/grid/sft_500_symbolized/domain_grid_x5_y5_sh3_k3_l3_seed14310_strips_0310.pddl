(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v7 ?v13)
             (pred_9 ?v4 ?v6)
             (pred_10 ?v7 ?v6)
             (pred_1 ?v10 ?v7 )
	     (pred_7 ?v7)
             (pred_8 ?v9)
             (pred_3 ?v4)
             (pred_2 ?v6)
             (pred_4 ?v7)
             (pred_11 ?v4)
             (pred_12 ?v7)
             (pred_5 ))



(:action op_4
:parameters (?v5 ?v1 ?v12 ?v2)
:precondition (and (pred_8 ?v5) (pred_8 ?v1) (pred_3 ?v12) (pred_2 ?v2)
          (pred_6 ?v5 ?v1) (pred_9 ?v12 ?v2)
                   (pred_10 ?v1 ?v2) (pred_7 ?v5) 
                   (pred_4 ?v1) (pred_11 ?v12))
:effect (and  (pred_12 ?v1) (not (pred_4 ?v1))))


(:action op_3
:parameters (?v5 ?v11)
:precondition (and (pred_8 ?v5) (pred_8 ?v11)
               (pred_7 ?v5) (pred_6 ?v5 ?v11) (pred_12 ?v11))
:effect (and (pred_7 ?v11) (not (pred_7 ?v5))))

(:action op_2
:parameters (?v5 ?v12)
:precondition (and (pred_8 ?v5) (pred_3 ?v12) 
                  (pred_7 ?v5) (pred_1 ?v12 ?v5) (pred_5 ))
:effect (and (pred_11 ?v12)
   (not (pred_1 ?v12 ?v5)) (not (pred_5 ))))


(:action op_5
:parameters (?v5 ?v8 ?v3)
:precondition (and (pred_8 ?v5) (pred_3 ?v8) (pred_3 ?v3)
                  (pred_7 ?v5) (pred_11 ?v3) (pred_1 ?v8 ?v5))
:effect (and (pred_11 ?v8) (pred_1 ?v3 ?v5)
        (not (pred_11 ?v3)) (not (pred_1 ?v8 ?v5))))

(:action op_1
:parameters (?v5 ?v12)
:precondition (and (pred_8 ?v5) (pred_3 ?v12) 
                  (pred_7 ?v5) (pred_11 ?v12))
:effect (and (pred_5 ) (pred_1 ?v12 ?v5) (not (pred_11 ?v12)))))


	
