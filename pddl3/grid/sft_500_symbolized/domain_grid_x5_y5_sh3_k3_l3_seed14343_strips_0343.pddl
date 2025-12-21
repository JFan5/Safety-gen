(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v13 ?v11)
             (pred_6 ?v4 ?v9)
             (pred_4 ?v13 ?v9)
             (pred_8 ?v12 ?v13 )
	     (pred_5 ?v13)
             (pred_2 ?v5)
             (pred_9 ?v4)
             (pred_10 ?v9)
             (pred_7 ?v13)
             (pred_3 ?v4)
             (pred_12 ?v13)
             (pred_1 ))



(:action op_1
:parameters (?v6 ?v1 ?v10 ?v7)
:precondition (and (pred_2 ?v6) (pred_2 ?v1) (pred_9 ?v10) (pred_10 ?v7)
          (pred_11 ?v6 ?v1) (pred_6 ?v10 ?v7)
                   (pred_4 ?v1 ?v7) (pred_5 ?v6) 
                   (pred_7 ?v1) (pred_3 ?v10))
:effect (and  (pred_12 ?v1) (not (pred_7 ?v1))))


(:action op_5
:parameters (?v6 ?v8)
:precondition (and (pred_2 ?v6) (pred_2 ?v8)
               (pred_5 ?v6) (pred_11 ?v6 ?v8) (pred_12 ?v8))
:effect (and (pred_5 ?v8) (not (pred_5 ?v6))))

(:action op_3
:parameters (?v6 ?v10)
:precondition (and (pred_2 ?v6) (pred_9 ?v10) 
                  (pred_5 ?v6) (pred_8 ?v10 ?v6) (pred_1 ))
:effect (and (pred_3 ?v10)
   (not (pred_8 ?v10 ?v6)) (not (pred_1 ))))


(:action op_2
:parameters (?v6 ?v3 ?v2)
:precondition (and (pred_2 ?v6) (pred_9 ?v3) (pred_9 ?v2)
                  (pred_5 ?v6) (pred_3 ?v2) (pred_8 ?v3 ?v6))
:effect (and (pred_3 ?v3) (pred_8 ?v2 ?v6)
        (not (pred_3 ?v2)) (not (pred_8 ?v3 ?v6))))

(:action op_4
:parameters (?v6 ?v10)
:precondition (and (pred_2 ?v6) (pred_9 ?v10) 
                  (pred_5 ?v6) (pred_3 ?v10))
:effect (and (pred_1 ) (pred_8 ?v10 ?v6) (not (pred_3 ?v10)))))


	
