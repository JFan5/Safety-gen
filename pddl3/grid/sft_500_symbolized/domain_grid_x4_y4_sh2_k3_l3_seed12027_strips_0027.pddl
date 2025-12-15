(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v4 ?v7)
             (pred_12 ?v11 ?v13)
             (pred_4 ?v4 ?v13)
             (pred_6 ?v2 ?v4 )
	     (pred_2 ?v4)
             (pred_8 ?v9)
             (pred_7 ?v11)
             (pred_3 ?v13)
             (pred_9 ?v4)
             (pred_1 ?v11)
             (pred_10 ?v4)
             (pred_5 ))



(:action op_3
:parameters (?v6 ?v10 ?v3 ?v12)
:precondition (and (pred_8 ?v6) (pred_8 ?v10) (pred_7 ?v3) (pred_3 ?v12)
          (pred_11 ?v6 ?v10) (pred_12 ?v3 ?v12)
                   (pred_4 ?v10 ?v12) (pred_2 ?v6) 
                   (pred_9 ?v10) (pred_1 ?v3))
:effect (and  (pred_10 ?v10) (not (pred_9 ?v10))))


(:action op_2
:parameters (?v6 ?v1)
:precondition (and (pred_8 ?v6) (pred_8 ?v1)
               (pred_2 ?v6) (pred_11 ?v6 ?v1) (pred_10 ?v1))
:effect (and (pred_2 ?v1) (not (pred_2 ?v6))))

(:action op_4
:parameters (?v6 ?v3)
:precondition (and (pred_8 ?v6) (pred_7 ?v3) 
                  (pred_2 ?v6) (pred_6 ?v3 ?v6) (pred_5 ))
:effect (and (pred_1 ?v3)
   (not (pred_6 ?v3 ?v6)) (not (pred_5 ))))


(:action op_5
:parameters (?v6 ?v8 ?v5)
:precondition (and (pred_8 ?v6) (pred_7 ?v8) (pred_7 ?v5)
                  (pred_2 ?v6) (pred_1 ?v5) (pred_6 ?v8 ?v6))
:effect (and (pred_1 ?v8) (pred_6 ?v5 ?v6)
        (not (pred_1 ?v5)) (not (pred_6 ?v8 ?v6))))

(:action op_1
:parameters (?v6 ?v3)
:precondition (and (pred_8 ?v6) (pred_7 ?v3) 
                  (pred_2 ?v6) (pred_1 ?v3))
:effect (and (pred_5 ) (pred_6 ?v3 ?v6) (not (pred_1 ?v3)))))


	
