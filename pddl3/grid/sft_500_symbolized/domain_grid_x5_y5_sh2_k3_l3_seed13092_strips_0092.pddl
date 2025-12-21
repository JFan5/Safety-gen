(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v7 ?v12)
             (pred_9 ?v10 ?v2)
             (pred_4 ?v7 ?v2)
             (pred_1 ?v8 ?v7 )
	     (pred_11 ?v7)
             (pred_10 ?v11)
             (pred_6 ?v10)
             (pred_12 ?v2)
             (pred_2 ?v7)
             (pred_5 ?v10)
             (pred_7 ?v7)
             (pred_8 ))



(:action op_5
:parameters (?v6 ?v1 ?v4 ?v5)
:precondition (and (pred_10 ?v6) (pred_10 ?v1) (pred_6 ?v4) (pred_12 ?v5)
          (pred_3 ?v6 ?v1) (pred_9 ?v4 ?v5)
                   (pred_4 ?v1 ?v5) (pred_11 ?v6) 
                   (pred_2 ?v1) (pred_5 ?v4))
:effect (and  (pred_7 ?v1) (not (pred_2 ?v1))))


(:action op_4
:parameters (?v6 ?v3)
:precondition (and (pred_10 ?v6) (pred_10 ?v3)
               (pred_11 ?v6) (pred_3 ?v6 ?v3) (pred_7 ?v3))
:effect (and (pred_11 ?v3) (not (pred_11 ?v6))))

(:action op_3
:parameters (?v6 ?v4)
:precondition (and (pred_10 ?v6) (pred_6 ?v4) 
                  (pred_11 ?v6) (pred_1 ?v4 ?v6) (pred_8 ))
:effect (and (pred_5 ?v4)
   (not (pred_1 ?v4 ?v6)) (not (pred_8 ))))


(:action op_1
:parameters (?v6 ?v9 ?v13)
:precondition (and (pred_10 ?v6) (pred_6 ?v9) (pred_6 ?v13)
                  (pred_11 ?v6) (pred_5 ?v13) (pred_1 ?v9 ?v6))
:effect (and (pred_5 ?v9) (pred_1 ?v13 ?v6)
        (not (pred_5 ?v13)) (not (pred_1 ?v9 ?v6))))

(:action op_2
:parameters (?v6 ?v4)
:precondition (and (pred_10 ?v6) (pred_6 ?v4) 
                  (pred_11 ?v6) (pred_5 ?v4))
:effect (and (pred_8 ) (pred_1 ?v4 ?v6) (not (pred_5 ?v4)))))


	
