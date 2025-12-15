(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v11 ?v13)
             (pred_4 ?v3 ?v1)
             (pred_1 ?v11 ?v1)
             (pred_10 ?v9 ?v11 )
	     (pred_12 ?v11)
             (pred_3 ?v7)
             (pred_11 ?v3)
             (pred_2 ?v1)
             (pred_9 ?v11)
             (pred_7 ?v3)
             (pred_8 ?v11)
             (pred_5 ))



(:action op_4
:parameters (?v6 ?v12 ?v2 ?v8)
:precondition (and (pred_3 ?v6) (pred_3 ?v12) (pred_11 ?v2) (pred_2 ?v8)
          (pred_6 ?v6 ?v12) (pred_4 ?v2 ?v8)
                   (pred_1 ?v12 ?v8) (pred_12 ?v6) 
                   (pred_9 ?v12) (pred_7 ?v2))
:effect (and  (pred_8 ?v12) (not (pred_9 ?v12))))


(:action op_1
:parameters (?v6 ?v5)
:precondition (and (pred_3 ?v6) (pred_3 ?v5)
               (pred_12 ?v6) (pred_6 ?v6 ?v5) (pred_8 ?v5))
:effect (and (pred_12 ?v5) (not (pred_12 ?v6))))

(:action op_3
:parameters (?v6 ?v2)
:precondition (and (pred_3 ?v6) (pred_11 ?v2) 
                  (pred_12 ?v6) (pred_10 ?v2 ?v6) (pred_5 ))
:effect (and (pred_7 ?v2)
   (not (pred_10 ?v2 ?v6)) (not (pred_5 ))))


(:action op_2
:parameters (?v6 ?v10 ?v4)
:precondition (and (pred_3 ?v6) (pred_11 ?v10) (pred_11 ?v4)
                  (pred_12 ?v6) (pred_7 ?v4) (pred_10 ?v10 ?v6))
:effect (and (pred_7 ?v10) (pred_10 ?v4 ?v6)
        (not (pred_7 ?v4)) (not (pred_10 ?v10 ?v6))))

(:action op_5
:parameters (?v6 ?v2)
:precondition (and (pred_3 ?v6) (pred_11 ?v2) 
                  (pred_12 ?v6) (pred_7 ?v2))
:effect (and (pred_5 ) (pred_10 ?v2 ?v6) (not (pred_7 ?v2)))))


	
