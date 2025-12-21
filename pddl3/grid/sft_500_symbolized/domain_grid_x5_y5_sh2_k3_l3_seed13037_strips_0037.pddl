(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v11 ?v8)
             (pred_1 ?v2 ?v9)
             (pred_12 ?v11 ?v9)
             (pred_5 ?v3 ?v11 )
	     (pred_3 ?v11)
             (pred_9 ?v13)
             (pred_11 ?v2)
             (pred_4 ?v9)
             (pred_2 ?v11)
             (pred_8 ?v2)
             (pred_10 ?v11)
             (pred_7 ))



(:action op_3
:parameters (?v12 ?v5 ?v1 ?v7)
:precondition (and (pred_9 ?v12) (pred_9 ?v5) (pred_11 ?v1) (pred_4 ?v7)
          (pred_6 ?v12 ?v5) (pred_1 ?v1 ?v7)
                   (pred_12 ?v5 ?v7) (pred_3 ?v12) 
                   (pred_2 ?v5) (pred_8 ?v1))
:effect (and  (pred_10 ?v5) (not (pred_2 ?v5))))


(:action op_4
:parameters (?v12 ?v6)
:precondition (and (pred_9 ?v12) (pred_9 ?v6)
               (pred_3 ?v12) (pred_6 ?v12 ?v6) (pred_10 ?v6))
:effect (and (pred_3 ?v6) (not (pred_3 ?v12))))

(:action op_2
:parameters (?v12 ?v1)
:precondition (and (pred_9 ?v12) (pred_11 ?v1) 
                  (pred_3 ?v12) (pred_5 ?v1 ?v12) (pred_7 ))
:effect (and (pred_8 ?v1)
   (not (pred_5 ?v1 ?v12)) (not (pred_7 ))))


(:action op_5
:parameters (?v12 ?v4 ?v10)
:precondition (and (pred_9 ?v12) (pred_11 ?v4) (pred_11 ?v10)
                  (pred_3 ?v12) (pred_8 ?v10) (pred_5 ?v4 ?v12))
:effect (and (pred_8 ?v4) (pred_5 ?v10 ?v12)
        (not (pred_8 ?v10)) (not (pred_5 ?v4 ?v12))))

(:action op_1
:parameters (?v12 ?v1)
:precondition (and (pred_9 ?v12) (pred_11 ?v1) 
                  (pred_3 ?v12) (pred_8 ?v1))
:effect (and (pred_7 ) (pred_5 ?v1 ?v12) (not (pred_8 ?v1)))))


	
