(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v5 ?v12)
             (pred_3 ?v4 ?v11)
             (pred_11 ?v5 ?v11)
             (pred_1 ?v13 ?v5 )
	     (pred_6 ?v5)
             (pred_5 ?v8)
             (pred_4 ?v4)
             (pred_9 ?v11)
             (pred_12 ?v5)
             (pred_10 ?v4)
             (pred_7 ?v5)
             (pred_2 ))



(:action op_3
:parameters (?v6 ?v9 ?v1 ?v7)
:precondition (and (pred_5 ?v6) (pred_5 ?v9) (pred_4 ?v1) (pred_9 ?v7)
          (pred_8 ?v6 ?v9) (pred_3 ?v1 ?v7)
                   (pred_11 ?v9 ?v7) (pred_6 ?v6) 
                   (pred_12 ?v9) (pred_10 ?v1))
:effect (and  (pred_7 ?v9) (not (pred_12 ?v9))))


(:action op_4
:parameters (?v6 ?v3)
:precondition (and (pred_5 ?v6) (pred_5 ?v3)
               (pred_6 ?v6) (pred_8 ?v6 ?v3) (pred_7 ?v3))
:effect (and (pred_6 ?v3) (not (pred_6 ?v6))))

(:action op_1
:parameters (?v6 ?v1)
:precondition (and (pred_5 ?v6) (pred_4 ?v1) 
                  (pred_6 ?v6) (pred_1 ?v1 ?v6) (pred_2 ))
:effect (and (pred_10 ?v1)
   (not (pred_1 ?v1 ?v6)) (not (pred_2 ))))


(:action op_5
:parameters (?v6 ?v2 ?v10)
:precondition (and (pred_5 ?v6) (pred_4 ?v2) (pred_4 ?v10)
                  (pred_6 ?v6) (pred_10 ?v10) (pred_1 ?v2 ?v6))
:effect (and (pred_10 ?v2) (pred_1 ?v10 ?v6)
        (not (pred_10 ?v10)) (not (pred_1 ?v2 ?v6))))

(:action op_2
:parameters (?v6 ?v1)
:precondition (and (pred_5 ?v6) (pred_4 ?v1) 
                  (pred_6 ?v6) (pred_10 ?v1))
:effect (and (pred_2 ) (pred_1 ?v1 ?v6) (not (pred_10 ?v1)))))


	
