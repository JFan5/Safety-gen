(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v10 ?v3)
             (pred_9 ?v11 ?v12)
             (pred_6 ?v10 ?v12)
             (pred_10 ?v9 ?v10 )
	     (pred_12 ?v10)
             (pred_2 ?v5)
             (pred_8 ?v11)
             (pred_1 ?v12)
             (pred_3 ?v10)
             (pred_5 ?v11)
             (pred_4 ?v10)
             (pred_11 ))



(:action op_4
:parameters (?v6 ?v1 ?v13 ?v8)
:precondition (and (pred_2 ?v6) (pred_2 ?v1) (pred_8 ?v13) (pred_1 ?v8)
          (pred_7 ?v6 ?v1) (pred_9 ?v13 ?v8)
                   (pred_6 ?v1 ?v8) (pred_12 ?v6) 
                   (pred_3 ?v1) (pred_5 ?v13))
:effect (and  (pred_4 ?v1) (not (pred_3 ?v1))))


(:action op_3
:parameters (?v6 ?v7)
:precondition (and (pred_2 ?v6) (pred_2 ?v7)
               (pred_12 ?v6) (pred_7 ?v6 ?v7) (pred_4 ?v7))
:effect (and (pred_12 ?v7) (not (pred_12 ?v6))))

(:action op_2
:parameters (?v6 ?v13)
:precondition (and (pred_2 ?v6) (pred_8 ?v13) 
                  (pred_12 ?v6) (pred_10 ?v13 ?v6) (pred_11 ))
:effect (and (pred_5 ?v13)
   (not (pred_10 ?v13 ?v6)) (not (pred_11 ))))


(:action op_5
:parameters (?v6 ?v2 ?v4)
:precondition (and (pred_2 ?v6) (pred_8 ?v2) (pred_8 ?v4)
                  (pred_12 ?v6) (pred_5 ?v4) (pred_10 ?v2 ?v6))
:effect (and (pred_5 ?v2) (pred_10 ?v4 ?v6)
        (not (pred_5 ?v4)) (not (pred_10 ?v2 ?v6))))

(:action op_1
:parameters (?v6 ?v13)
:precondition (and (pred_2 ?v6) (pred_8 ?v13) 
                  (pred_12 ?v6) (pred_5 ?v13))
:effect (and (pred_11 ) (pred_10 ?v13 ?v6) (not (pred_5 ?v13)))))


	
