(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v4 ?v5)
             (pred_11 ?v9 ?v1)
             (pred_5 ?v4 ?v1)
             (pred_8 ?v12 ?v4 )
	     (pred_6 ?v4)
             (pred_10 ?v11)
             (pred_3 ?v9)
             (pred_1 ?v1)
             (pred_7 ?v4)
             (pred_12 ?v9)
             (pred_4 ?v4)
             (pred_2 ))



(:action op_3
:parameters (?v6 ?v3 ?v7 ?v13)
:precondition (and (pred_10 ?v6) (pred_10 ?v3) (pred_3 ?v7) (pred_1 ?v13)
          (pred_9 ?v6 ?v3) (pred_11 ?v7 ?v13)
                   (pred_5 ?v3 ?v13) (pred_6 ?v6) 
                   (pred_7 ?v3) (pred_12 ?v7))
:effect (and  (pred_4 ?v3) (not (pred_7 ?v3))))


(:action op_5
:parameters (?v6 ?v2)
:precondition (and (pred_10 ?v6) (pred_10 ?v2)
               (pred_6 ?v6) (pred_9 ?v6 ?v2) (pred_4 ?v2))
:effect (and (pred_6 ?v2) (not (pred_6 ?v6))))

(:action op_2
:parameters (?v6 ?v7)
:precondition (and (pred_10 ?v6) (pred_3 ?v7) 
                  (pred_6 ?v6) (pred_8 ?v7 ?v6) (pred_2 ))
:effect (and (pred_12 ?v7)
   (not (pred_8 ?v7 ?v6)) (not (pred_2 ))))


(:action op_1
:parameters (?v6 ?v10 ?v8)
:precondition (and (pred_10 ?v6) (pred_3 ?v10) (pred_3 ?v8)
                  (pred_6 ?v6) (pred_12 ?v8) (pred_8 ?v10 ?v6))
:effect (and (pred_12 ?v10) (pred_8 ?v8 ?v6)
        (not (pred_12 ?v8)) (not (pred_8 ?v10 ?v6))))

(:action op_4
:parameters (?v6 ?v7)
:precondition (and (pred_10 ?v6) (pred_3 ?v7) 
                  (pred_6 ?v6) (pred_12 ?v7))
:effect (and (pred_2 ) (pred_8 ?v7 ?v6) (not (pred_12 ?v7)))))


	
