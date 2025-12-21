(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v12 ?v5)
             (pred_10 ?v9 ?v10)
             (pred_1 ?v12 ?v10)
             (pred_9 ?v2 ?v12 )
	     (pred_12 ?v12)
             (pred_4 ?v3)
             (pred_3 ?v9)
             (pred_8 ?v10)
             (pred_11 ?v12)
             (pred_5 ?v9)
             (pred_7 ?v12)
             (pred_2 ))



(:action op_2
:parameters (?v6 ?v1 ?v7 ?v4)
:precondition (and (pred_4 ?v6) (pred_4 ?v1) (pred_3 ?v7) (pred_8 ?v4)
          (pred_6 ?v6 ?v1) (pred_10 ?v7 ?v4)
                   (pred_1 ?v1 ?v4) (pred_12 ?v6) 
                   (pred_11 ?v1) (pred_5 ?v7))
:effect (and  (pred_7 ?v1) (not (pred_11 ?v1))))


(:action op_3
:parameters (?v6 ?v8)
:precondition (and (pred_4 ?v6) (pred_4 ?v8)
               (pred_12 ?v6) (pred_6 ?v6 ?v8) (pred_7 ?v8))
:effect (and (pred_12 ?v8) (not (pred_12 ?v6))))

(:action op_5
:parameters (?v6 ?v7)
:precondition (and (pred_4 ?v6) (pred_3 ?v7) 
                  (pred_12 ?v6) (pred_9 ?v7 ?v6) (pred_2 ))
:effect (and (pred_5 ?v7)
   (not (pred_9 ?v7 ?v6)) (not (pred_2 ))))


(:action op_4
:parameters (?v6 ?v11 ?v13)
:precondition (and (pred_4 ?v6) (pred_3 ?v11) (pred_3 ?v13)
                  (pred_12 ?v6) (pred_5 ?v13) (pred_9 ?v11 ?v6))
:effect (and (pred_5 ?v11) (pred_9 ?v13 ?v6)
        (not (pred_5 ?v13)) (not (pred_9 ?v11 ?v6))))

(:action op_1
:parameters (?v6 ?v7)
:precondition (and (pred_4 ?v6) (pred_3 ?v7) 
                  (pred_12 ?v6) (pred_5 ?v7))
:effect (and (pred_2 ) (pred_9 ?v7 ?v6) (not (pred_5 ?v7)))))


	
