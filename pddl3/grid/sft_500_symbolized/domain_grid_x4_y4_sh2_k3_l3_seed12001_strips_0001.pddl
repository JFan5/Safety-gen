(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v10 ?v5)
             (pred_12 ?v8 ?v3)
             (pred_1 ?v10 ?v3)
             (pred_4 ?v2 ?v10 )
	     (pred_9 ?v10)
             (pred_2 ?v7)
             (pred_5 ?v8)
             (pred_11 ?v3)
             (pred_7 ?v10)
             (pred_10 ?v8)
             (pred_8 ?v10)
             (pred_6 ))



(:action op_4
:parameters (?v6 ?v9 ?v11 ?v13)
:precondition (and (pred_2 ?v6) (pred_2 ?v9) (pred_5 ?v11) (pred_11 ?v13)
          (pred_3 ?v6 ?v9) (pred_12 ?v11 ?v13)
                   (pred_1 ?v9 ?v13) (pred_9 ?v6) 
                   (pred_7 ?v9) (pred_10 ?v11))
:effect (and  (pred_8 ?v9) (not (pred_7 ?v9))))


(:action op_2
:parameters (?v6 ?v12)
:precondition (and (pred_2 ?v6) (pred_2 ?v12)
               (pred_9 ?v6) (pred_3 ?v6 ?v12) (pred_8 ?v12))
:effect (and (pred_9 ?v12) (not (pred_9 ?v6))))

(:action op_3
:parameters (?v6 ?v11)
:precondition (and (pred_2 ?v6) (pred_5 ?v11) 
                  (pred_9 ?v6) (pred_4 ?v11 ?v6) (pred_6 ))
:effect (and (pred_10 ?v11)
   (not (pred_4 ?v11 ?v6)) (not (pred_6 ))))


(:action op_1
:parameters (?v6 ?v4 ?v1)
:precondition (and (pred_2 ?v6) (pred_5 ?v4) (pred_5 ?v1)
                  (pred_9 ?v6) (pred_10 ?v1) (pred_4 ?v4 ?v6))
:effect (and (pred_10 ?v4) (pred_4 ?v1 ?v6)
        (not (pred_10 ?v1)) (not (pred_4 ?v4 ?v6))))

(:action op_5
:parameters (?v6 ?v11)
:precondition (and (pred_2 ?v6) (pred_5 ?v11) 
                  (pred_9 ?v6) (pred_10 ?v11))
:effect (and (pred_6 ) (pred_4 ?v11 ?v6) (not (pred_10 ?v11)))))


	
