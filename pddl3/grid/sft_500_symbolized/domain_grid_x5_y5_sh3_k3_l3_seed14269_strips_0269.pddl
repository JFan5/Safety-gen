(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v11 ?v2)
             (pred_9 ?v1 ?v7)
             (pred_6 ?v11 ?v7)
             (pred_10 ?v8 ?v11 )
	     (pred_1 ?v11)
             (pred_4 ?v4)
             (pred_8 ?v1)
             (pred_3 ?v7)
             (pred_12 ?v11)
             (pred_5 ?v1)
             (pred_11 ?v11)
             (pred_2 ))



(:action op_4
:parameters (?v6 ?v10 ?v12 ?v3)
:precondition (and (pred_4 ?v6) (pred_4 ?v10) (pred_8 ?v12) (pred_3 ?v3)
          (pred_7 ?v6 ?v10) (pred_9 ?v12 ?v3)
                   (pred_6 ?v10 ?v3) (pred_1 ?v6) 
                   (pred_12 ?v10) (pred_5 ?v12))
:effect (and  (pred_11 ?v10) (not (pred_12 ?v10))))


(:action op_5
:parameters (?v6 ?v13)
:precondition (and (pred_4 ?v6) (pred_4 ?v13)
               (pred_1 ?v6) (pred_7 ?v6 ?v13) (pred_11 ?v13))
:effect (and (pred_1 ?v13) (not (pred_1 ?v6))))

(:action op_2
:parameters (?v6 ?v12)
:precondition (and (pred_4 ?v6) (pred_8 ?v12) 
                  (pred_1 ?v6) (pred_10 ?v12 ?v6) (pred_2 ))
:effect (and (pred_5 ?v12)
   (not (pred_10 ?v12 ?v6)) (not (pred_2 ))))


(:action op_1
:parameters (?v6 ?v9 ?v5)
:precondition (and (pred_4 ?v6) (pred_8 ?v9) (pred_8 ?v5)
                  (pred_1 ?v6) (pred_5 ?v5) (pred_10 ?v9 ?v6))
:effect (and (pred_5 ?v9) (pred_10 ?v5 ?v6)
        (not (pred_5 ?v5)) (not (pred_10 ?v9 ?v6))))

(:action op_3
:parameters (?v6 ?v12)
:precondition (and (pred_4 ?v6) (pred_8 ?v12) 
                  (pred_1 ?v6) (pred_5 ?v12))
:effect (and (pred_2 ) (pred_10 ?v12 ?v6) (not (pred_5 ?v12)))))


	
