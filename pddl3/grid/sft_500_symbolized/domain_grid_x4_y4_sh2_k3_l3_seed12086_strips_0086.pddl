(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v11 ?v12)
             (pred_7 ?v5 ?v3)
             (pred_3 ?v11 ?v3)
             (pred_8 ?v9 ?v11 )
	     (pred_5 ?v11)
             (pred_12 ?v2)
             (pred_4 ?v5)
             (pred_11 ?v3)
             (pred_1 ?v11)
             (pred_10 ?v5)
             (pred_6 ?v11)
             (pred_2 ))



(:action op_4
:parameters (?v6 ?v8 ?v1 ?v7)
:precondition (and (pred_12 ?v6) (pred_12 ?v8) (pred_4 ?v1) (pred_11 ?v7)
          (pred_9 ?v6 ?v8) (pred_7 ?v1 ?v7)
                   (pred_3 ?v8 ?v7) (pred_5 ?v6) 
                   (pred_1 ?v8) (pred_10 ?v1))
:effect (and  (pred_6 ?v8) (not (pred_1 ?v8))))


(:action op_1
:parameters (?v6 ?v13)
:precondition (and (pred_12 ?v6) (pred_12 ?v13)
               (pred_5 ?v6) (pred_9 ?v6 ?v13) (pred_6 ?v13))
:effect (and (pred_5 ?v13) (not (pred_5 ?v6))))

(:action op_3
:parameters (?v6 ?v1)
:precondition (and (pred_12 ?v6) (pred_4 ?v1) 
                  (pred_5 ?v6) (pred_8 ?v1 ?v6) (pred_2 ))
:effect (and (pred_10 ?v1)
   (not (pred_8 ?v1 ?v6)) (not (pred_2 ))))


(:action op_5
:parameters (?v6 ?v10 ?v4)
:precondition (and (pred_12 ?v6) (pred_4 ?v10) (pred_4 ?v4)
                  (pred_5 ?v6) (pred_10 ?v4) (pred_8 ?v10 ?v6))
:effect (and (pred_10 ?v10) (pred_8 ?v4 ?v6)
        (not (pred_10 ?v4)) (not (pred_8 ?v10 ?v6))))

(:action op_2
:parameters (?v6 ?v1)
:precondition (and (pred_12 ?v6) (pred_4 ?v1) 
                  (pred_5 ?v6) (pred_10 ?v1))
:effect (and (pred_2 ) (pred_8 ?v1 ?v6) (not (pred_10 ?v1)))))


	
