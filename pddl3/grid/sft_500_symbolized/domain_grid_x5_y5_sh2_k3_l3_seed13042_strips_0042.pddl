(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v10 ?v2)
             (pred_2 ?v8 ?v5)
             (pred_11 ?v10 ?v5)
             (pred_5 ?v4 ?v10 )
	     (pred_7 ?v10)
             (pred_8 ?v1)
             (pred_3 ?v8)
             (pred_4 ?v5)
             (pred_10 ?v10)
             (pred_9 ?v8)
             (pred_12 ?v10)
             (pred_1 ))



(:action op_2
:parameters (?v6 ?v11 ?v7 ?v9)
:precondition (and (pred_8 ?v6) (pred_8 ?v11) (pred_3 ?v7) (pred_4 ?v9)
          (pred_6 ?v6 ?v11) (pred_2 ?v7 ?v9)
                   (pred_11 ?v11 ?v9) (pred_7 ?v6) 
                   (pred_10 ?v11) (pred_9 ?v7))
:effect (and  (pred_12 ?v11) (not (pred_10 ?v11))))


(:action op_5
:parameters (?v6 ?v13)
:precondition (and (pred_8 ?v6) (pred_8 ?v13)
               (pred_7 ?v6) (pred_6 ?v6 ?v13) (pred_12 ?v13))
:effect (and (pred_7 ?v13) (not (pred_7 ?v6))))

(:action op_1
:parameters (?v6 ?v7)
:precondition (and (pred_8 ?v6) (pred_3 ?v7) 
                  (pred_7 ?v6) (pred_5 ?v7 ?v6) (pred_1 ))
:effect (and (pred_9 ?v7)
   (not (pred_5 ?v7 ?v6)) (not (pred_1 ))))


(:action op_3
:parameters (?v6 ?v3 ?v12)
:precondition (and (pred_8 ?v6) (pred_3 ?v3) (pred_3 ?v12)
                  (pred_7 ?v6) (pred_9 ?v12) (pred_5 ?v3 ?v6))
:effect (and (pred_9 ?v3) (pred_5 ?v12 ?v6)
        (not (pred_9 ?v12)) (not (pred_5 ?v3 ?v6))))

(:action op_4
:parameters (?v6 ?v7)
:precondition (and (pred_8 ?v6) (pred_3 ?v7) 
                  (pred_7 ?v6) (pred_9 ?v7))
:effect (and (pred_1 ) (pred_5 ?v7 ?v6) (not (pred_9 ?v7)))))


	
