(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v3 ?v11)
             (pred_5 ?v9 ?v8)
             (pred_11 ?v3 ?v8)
             (pred_10 ?v12 ?v3 )
	     (pred_2 ?v3)
             (pred_7 ?v13)
             (pred_6 ?v9)
             (pred_3 ?v8)
             (pred_1 ?v3)
             (pred_4 ?v9)
             (pred_12 ?v3)
             (pred_8 ))



(:action op_2
:parameters (?v6 ?v10 ?v1 ?v4)
:precondition (and (pred_7 ?v6) (pred_7 ?v10) (pred_6 ?v1) (pred_3 ?v4)
          (pred_9 ?v6 ?v10) (pred_5 ?v1 ?v4)
                   (pred_11 ?v10 ?v4) (pred_2 ?v6) 
                   (pred_1 ?v10) (pred_4 ?v1))
:effect (and  (pred_12 ?v10) (not (pred_1 ?v10))))


(:action op_1
:parameters (?v6 ?v5)
:precondition (and (pred_7 ?v6) (pred_7 ?v5)
               (pred_2 ?v6) (pred_9 ?v6 ?v5) (pred_12 ?v5))
:effect (and (pred_2 ?v5) (not (pred_2 ?v6))))

(:action op_3
:parameters (?v6 ?v1)
:precondition (and (pred_7 ?v6) (pred_6 ?v1) 
                  (pred_2 ?v6) (pred_10 ?v1 ?v6) (pred_8 ))
:effect (and (pred_4 ?v1)
   (not (pred_10 ?v1 ?v6)) (not (pred_8 ))))


(:action op_4
:parameters (?v6 ?v2 ?v7)
:precondition (and (pred_7 ?v6) (pred_6 ?v2) (pred_6 ?v7)
                  (pred_2 ?v6) (pred_4 ?v7) (pred_10 ?v2 ?v6))
:effect (and (pred_4 ?v2) (pred_10 ?v7 ?v6)
        (not (pred_4 ?v7)) (not (pred_10 ?v2 ?v6))))

(:action op_5
:parameters (?v6 ?v1)
:precondition (and (pred_7 ?v6) (pred_6 ?v1) 
                  (pred_2 ?v6) (pred_4 ?v1))
:effect (and (pred_8 ) (pred_10 ?v1 ?v6) (not (pred_4 ?v1)))))


	
