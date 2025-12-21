(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v4 ?v5)
             (pred_6 ?v10 ?v3)
             (pred_2 ?v4 ?v3)
             (pred_4 ?v8 ?v4 )
	     (pred_7 ?v4)
             (pred_3 ?v9)
             (pred_9 ?v10)
             (pred_8 ?v3)
             (pred_11 ?v4)
             (pred_1 ?v10)
             (pred_10 ?v4)
             (pred_12 ))



(:action op_3
:parameters (?v6 ?v2 ?v1 ?v12)
:precondition (and (pred_3 ?v6) (pred_3 ?v2) (pred_9 ?v1) (pred_8 ?v12)
          (pred_5 ?v6 ?v2) (pred_6 ?v1 ?v12)
                   (pred_2 ?v2 ?v12) (pred_7 ?v6) 
                   (pred_11 ?v2) (pred_1 ?v1))
:effect (and  (pred_10 ?v2) (not (pred_11 ?v2))))


(:action op_2
:parameters (?v6 ?v7)
:precondition (and (pred_3 ?v6) (pred_3 ?v7)
               (pred_7 ?v6) (pred_5 ?v6 ?v7) (pred_10 ?v7))
:effect (and (pred_7 ?v7) (not (pred_7 ?v6))))

(:action op_1
:parameters (?v6 ?v1)
:precondition (and (pred_3 ?v6) (pred_9 ?v1) 
                  (pred_7 ?v6) (pred_4 ?v1 ?v6) (pred_12 ))
:effect (and (pred_1 ?v1)
   (not (pred_4 ?v1 ?v6)) (not (pred_12 ))))


(:action op_5
:parameters (?v6 ?v11 ?v13)
:precondition (and (pred_3 ?v6) (pred_9 ?v11) (pred_9 ?v13)
                  (pred_7 ?v6) (pred_1 ?v13) (pred_4 ?v11 ?v6))
:effect (and (pred_1 ?v11) (pred_4 ?v13 ?v6)
        (not (pred_1 ?v13)) (not (pred_4 ?v11 ?v6))))

(:action op_4
:parameters (?v6 ?v1)
:precondition (and (pred_3 ?v6) (pred_9 ?v1) 
                  (pred_7 ?v6) (pred_1 ?v1))
:effect (and (pred_12 ) (pred_4 ?v1 ?v6) (not (pred_1 ?v1)))))


	
