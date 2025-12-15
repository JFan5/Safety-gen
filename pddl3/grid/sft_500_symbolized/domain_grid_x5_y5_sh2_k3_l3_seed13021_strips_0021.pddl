(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v9 ?v4)
             (pred_4 ?v7 ?v11)
             (pred_9 ?v9 ?v11)
             (pred_11 ?v13 ?v9 )
	     (pred_8 ?v9)
             (pred_12 ?v2)
             (pred_3 ?v7)
             (pred_7 ?v11)
             (pred_2 ?v9)
             (pred_10 ?v7)
             (pred_6 ?v9)
             (pred_5 ))



(:action op_2
:parameters (?v12 ?v3 ?v10 ?v5)
:precondition (and (pred_12 ?v12) (pred_12 ?v3) (pred_3 ?v10) (pred_7 ?v5)
          (pred_1 ?v12 ?v3) (pred_4 ?v10 ?v5)
                   (pred_9 ?v3 ?v5) (pred_8 ?v12) 
                   (pred_2 ?v3) (pred_10 ?v10))
:effect (and  (pred_6 ?v3) (not (pred_2 ?v3))))


(:action op_4
:parameters (?v12 ?v6)
:precondition (and (pred_12 ?v12) (pred_12 ?v6)
               (pred_8 ?v12) (pred_1 ?v12 ?v6) (pred_6 ?v6))
:effect (and (pred_8 ?v6) (not (pred_8 ?v12))))

(:action op_5
:parameters (?v12 ?v10)
:precondition (and (pred_12 ?v12) (pred_3 ?v10) 
                  (pred_8 ?v12) (pred_11 ?v10 ?v12) (pred_5 ))
:effect (and (pred_10 ?v10)
   (not (pred_11 ?v10 ?v12)) (not (pred_5 ))))


(:action op_1
:parameters (?v12 ?v1 ?v8)
:precondition (and (pred_12 ?v12) (pred_3 ?v1) (pred_3 ?v8)
                  (pred_8 ?v12) (pred_10 ?v8) (pred_11 ?v1 ?v12))
:effect (and (pred_10 ?v1) (pred_11 ?v8 ?v12)
        (not (pred_10 ?v8)) (not (pred_11 ?v1 ?v12))))

(:action op_3
:parameters (?v12 ?v10)
:precondition (and (pred_12 ?v12) (pred_3 ?v10) 
                  (pred_8 ?v12) (pred_10 ?v10))
:effect (and (pred_5 ) (pred_11 ?v10 ?v12) (not (pred_10 ?v10)))))


	
