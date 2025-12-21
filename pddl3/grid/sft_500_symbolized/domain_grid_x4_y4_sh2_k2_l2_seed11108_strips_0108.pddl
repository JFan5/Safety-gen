(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v7 ?v4)
             (pred_5 ?v1 ?v9)
             (pred_1 ?v7 ?v9)
             (pred_4 ?v10 ?v7 )
	     (pred_8 ?v7)
             (pred_7 ?v3)
             (pred_6 ?v1)
             (pred_11 ?v9)
             (pred_9 ?v7)
             (pred_10 ?v1)
             (pred_2 ?v7)
             (pred_12 ))



(:action op_1
:parameters (?v6 ?v11 ?v5 ?v13)
:precondition (and (pred_7 ?v6) (pred_7 ?v11) (pred_6 ?v5) (pred_11 ?v13)
          (pred_3 ?v6 ?v11) (pred_5 ?v5 ?v13)
                   (pred_1 ?v11 ?v13) (pred_8 ?v6) 
                   (pred_9 ?v11) (pred_10 ?v5))
:effect (and  (pred_2 ?v11) (not (pred_9 ?v11))))


(:action op_3
:parameters (?v6 ?v8)
:precondition (and (pred_7 ?v6) (pred_7 ?v8)
               (pred_8 ?v6) (pred_3 ?v6 ?v8) (pred_2 ?v8))
:effect (and (pred_8 ?v8) (not (pred_8 ?v6))))

(:action op_4
:parameters (?v6 ?v5)
:precondition (and (pred_7 ?v6) (pred_6 ?v5) 
                  (pred_8 ?v6) (pred_4 ?v5 ?v6) (pred_12 ))
:effect (and (pred_10 ?v5)
   (not (pred_4 ?v5 ?v6)) (not (pred_12 ))))


(:action op_5
:parameters (?v6 ?v12 ?v2)
:precondition (and (pred_7 ?v6) (pred_6 ?v12) (pred_6 ?v2)
                  (pred_8 ?v6) (pred_10 ?v2) (pred_4 ?v12 ?v6))
:effect (and (pred_10 ?v12) (pred_4 ?v2 ?v6)
        (not (pred_10 ?v2)) (not (pred_4 ?v12 ?v6))))

(:action op_2
:parameters (?v6 ?v5)
:precondition (and (pred_7 ?v6) (pred_6 ?v5) 
                  (pred_8 ?v6) (pred_10 ?v5))
:effect (and (pred_12 ) (pred_4 ?v5 ?v6) (not (pred_10 ?v5)))))


	
