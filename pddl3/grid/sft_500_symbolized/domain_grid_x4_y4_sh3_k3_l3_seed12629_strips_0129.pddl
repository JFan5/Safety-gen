(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v11 ?v9)
             (pred_12 ?v8 ?v13)
             (pred_3 ?v11 ?v13)
             (pred_4 ?v12 ?v11 )
	     (pred_10 ?v11)
             (pred_7 ?v5)
             (pred_9 ?v8)
             (pred_8 ?v13)
             (pred_2 ?v11)
             (pred_6 ?v8)
             (pred_1 ?v11)
             (pred_5 ))



(:action op_5
:parameters (?v6 ?v2 ?v4 ?v3)
:precondition (and (pred_7 ?v6) (pred_7 ?v2) (pred_9 ?v4) (pred_8 ?v3)
          (pred_11 ?v6 ?v2) (pred_12 ?v4 ?v3)
                   (pred_3 ?v2 ?v3) (pred_10 ?v6) 
                   (pred_2 ?v2) (pred_6 ?v4))
:effect (and  (pred_1 ?v2) (not (pred_2 ?v2))))


(:action op_2
:parameters (?v6 ?v10)
:precondition (and (pred_7 ?v6) (pred_7 ?v10)
               (pred_10 ?v6) (pred_11 ?v6 ?v10) (pred_1 ?v10))
:effect (and (pred_10 ?v10) (not (pred_10 ?v6))))

(:action op_4
:parameters (?v6 ?v4)
:precondition (and (pred_7 ?v6) (pred_9 ?v4) 
                  (pred_10 ?v6) (pred_4 ?v4 ?v6) (pred_5 ))
:effect (and (pred_6 ?v4)
   (not (pred_4 ?v4 ?v6)) (not (pred_5 ))))


(:action op_1
:parameters (?v6 ?v1 ?v7)
:precondition (and (pred_7 ?v6) (pred_9 ?v1) (pred_9 ?v7)
                  (pred_10 ?v6) (pred_6 ?v7) (pred_4 ?v1 ?v6))
:effect (and (pred_6 ?v1) (pred_4 ?v7 ?v6)
        (not (pred_6 ?v7)) (not (pred_4 ?v1 ?v6))))

(:action op_3
:parameters (?v6 ?v4)
:precondition (and (pred_7 ?v6) (pred_9 ?v4) 
                  (pred_10 ?v6) (pred_6 ?v4))
:effect (and (pred_5 ) (pred_4 ?v4 ?v6) (not (pred_6 ?v4)))))


	
