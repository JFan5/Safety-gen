(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v7 ?v1)
             (pred_11 ?v9 ?v12)
             (pred_9 ?v7 ?v12)
             (pred_8 ?v10 ?v7 )
	     (pred_12 ?v7)
             (pred_7 ?v5)
             (pred_1 ?v9)
             (pred_3 ?v12)
             (pred_6 ?v7)
             (pred_5 ?v9)
             (pred_2 ?v7)
             (pred_4 ))



(:action op_5
:parameters (?v6 ?v3 ?v11 ?v8)
:precondition (and (pred_7 ?v6) (pred_7 ?v3) (pred_1 ?v11) (pred_3 ?v8)
          (pred_10 ?v6 ?v3) (pred_11 ?v11 ?v8)
                   (pred_9 ?v3 ?v8) (pred_12 ?v6) 
                   (pred_6 ?v3) (pred_5 ?v11))
:effect (and  (pred_2 ?v3) (not (pred_6 ?v3))))


(:action op_4
:parameters (?v6 ?v2)
:precondition (and (pred_7 ?v6) (pred_7 ?v2)
               (pred_12 ?v6) (pred_10 ?v6 ?v2) (pred_2 ?v2))
:effect (and (pred_12 ?v2) (not (pred_12 ?v6))))

(:action op_2
:parameters (?v6 ?v11)
:precondition (and (pred_7 ?v6) (pred_1 ?v11) 
                  (pred_12 ?v6) (pred_8 ?v11 ?v6) (pred_4 ))
:effect (and (pred_5 ?v11)
   (not (pred_8 ?v11 ?v6)) (not (pred_4 ))))


(:action op_1
:parameters (?v6 ?v4 ?v13)
:precondition (and (pred_7 ?v6) (pred_1 ?v4) (pred_1 ?v13)
                  (pred_12 ?v6) (pred_5 ?v13) (pred_8 ?v4 ?v6))
:effect (and (pred_5 ?v4) (pred_8 ?v13 ?v6)
        (not (pred_5 ?v13)) (not (pred_8 ?v4 ?v6))))

(:action op_3
:parameters (?v6 ?v11)
:precondition (and (pred_7 ?v6) (pred_1 ?v11) 
                  (pred_12 ?v6) (pred_5 ?v11))
:effect (and (pred_4 ) (pred_8 ?v11 ?v6) (not (pred_5 ?v11)))))


	
