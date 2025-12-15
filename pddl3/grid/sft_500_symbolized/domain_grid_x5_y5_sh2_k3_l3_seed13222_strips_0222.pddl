(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v5 ?v11)
             (pred_6 ?v8 ?v10)
             (pred_8 ?v5 ?v10)
             (pred_10 ?v9 ?v5 )
	     (pred_1 ?v5)
             (pred_2 ?v2)
             (pred_12 ?v8)
             (pred_4 ?v10)
             (pred_3 ?v5)
             (pred_11 ?v8)
             (pred_5 ?v5)
             (pred_9 ))



(:action op_3
:parameters (?v12 ?v1 ?v3 ?v7)
:precondition (and (pred_2 ?v12) (pred_2 ?v1) (pred_12 ?v3) (pred_4 ?v7)
          (pred_7 ?v12 ?v1) (pred_6 ?v3 ?v7)
                   (pred_8 ?v1 ?v7) (pred_1 ?v12) 
                   (pred_3 ?v1) (pred_11 ?v3))
:effect (and  (pred_5 ?v1) (not (pred_3 ?v1))))


(:action op_1
:parameters (?v12 ?v6)
:precondition (and (pred_2 ?v12) (pred_2 ?v6)
               (pred_1 ?v12) (pred_7 ?v12 ?v6) (pred_5 ?v6))
:effect (and (pred_1 ?v6) (not (pred_1 ?v12))))

(:action op_2
:parameters (?v12 ?v3)
:precondition (and (pred_2 ?v12) (pred_12 ?v3) 
                  (pred_1 ?v12) (pred_10 ?v3 ?v12) (pred_9 ))
:effect (and (pred_11 ?v3)
   (not (pred_10 ?v3 ?v12)) (not (pred_9 ))))


(:action op_4
:parameters (?v12 ?v4 ?v13)
:precondition (and (pred_2 ?v12) (pred_12 ?v4) (pred_12 ?v13)
                  (pred_1 ?v12) (pred_11 ?v13) (pred_10 ?v4 ?v12))
:effect (and (pred_11 ?v4) (pred_10 ?v13 ?v12)
        (not (pred_11 ?v13)) (not (pred_10 ?v4 ?v12))))

(:action op_5
:parameters (?v12 ?v3)
:precondition (and (pred_2 ?v12) (pred_12 ?v3) 
                  (pred_1 ?v12) (pred_11 ?v3))
:effect (and (pred_9 ) (pred_10 ?v3 ?v12) (not (pred_11 ?v3)))))


	
