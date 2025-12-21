(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v7 ?v3)
             (pred_2 ?v9 ?v4)
             (pred_10 ?v7 ?v4)
             (pred_12 ?v11 ?v7 )
	     (pred_8 ?v7)
             (pred_3 ?v5)
             (pred_5 ?v9)
             (pred_7 ?v4)
             (pred_9 ?v7)
             (pred_11 ?v9)
             (pred_6 ?v7)
             (pred_1 ))



(:action op_3
:parameters (?v12 ?v1 ?v6 ?v8)
:precondition (and (pred_3 ?v12) (pred_3 ?v1) (pred_5 ?v6) (pred_7 ?v8)
          (pred_4 ?v12 ?v1) (pred_2 ?v6 ?v8)
                   (pred_10 ?v1 ?v8) (pred_8 ?v12) 
                   (pred_9 ?v1) (pred_11 ?v6))
:effect (and  (pred_6 ?v1) (not (pred_9 ?v1))))


(:action op_4
:parameters (?v12 ?v2)
:precondition (and (pred_3 ?v12) (pred_3 ?v2)
               (pred_8 ?v12) (pred_4 ?v12 ?v2) (pred_6 ?v2))
:effect (and (pred_8 ?v2) (not (pred_8 ?v12))))

(:action op_5
:parameters (?v12 ?v6)
:precondition (and (pred_3 ?v12) (pred_5 ?v6) 
                  (pred_8 ?v12) (pred_12 ?v6 ?v12) (pred_1 ))
:effect (and (pred_11 ?v6)
   (not (pred_12 ?v6 ?v12)) (not (pred_1 ))))


(:action op_2
:parameters (?v12 ?v13 ?v10)
:precondition (and (pred_3 ?v12) (pred_5 ?v13) (pred_5 ?v10)
                  (pred_8 ?v12) (pred_11 ?v10) (pred_12 ?v13 ?v12))
:effect (and (pred_11 ?v13) (pred_12 ?v10 ?v12)
        (not (pred_11 ?v10)) (not (pred_12 ?v13 ?v12))))

(:action op_1
:parameters (?v12 ?v6)
:precondition (and (pred_3 ?v12) (pred_5 ?v6) 
                  (pred_8 ?v12) (pred_11 ?v6))
:effect (and (pred_1 ) (pred_12 ?v6 ?v12) (not (pred_11 ?v6)))))


	
