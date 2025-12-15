(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v2 ?v12)
             (pred_7 ?v4 ?v10)
             (pred_6 ?v2 ?v10)
             (pred_5 ?v1 ?v2 )
	     (pred_1 ?v2)
             (pred_8 ?v8)
             (pred_12 ?v4)
             (pred_4 ?v10)
             (pred_9 ?v2)
             (pred_3 ?v4)
             (pred_2 ?v2)
             (pred_11 ))



(:action op_4
:parameters (?v11 ?v6 ?v3 ?v13)
:precondition (and (pred_8 ?v11) (pred_8 ?v6) (pred_12 ?v3) (pred_4 ?v13)
          (pred_10 ?v11 ?v6) (pred_7 ?v3 ?v13)
                   (pred_6 ?v6 ?v13) (pred_1 ?v11) 
                   (pred_9 ?v6) (pred_3 ?v3))
:effect (and  (pred_2 ?v6) (not (pred_9 ?v6))))


(:action op_3
:parameters (?v11 ?v5)
:precondition (and (pred_8 ?v11) (pred_8 ?v5)
               (pred_1 ?v11) (pred_10 ?v11 ?v5) (pred_2 ?v5))
:effect (and (pred_1 ?v5) (not (pred_1 ?v11))))

(:action op_5
:parameters (?v11 ?v3)
:precondition (and (pred_8 ?v11) (pred_12 ?v3) 
                  (pred_1 ?v11) (pred_5 ?v3 ?v11) (pred_11 ))
:effect (and (pred_3 ?v3)
   (not (pred_5 ?v3 ?v11)) (not (pred_11 ))))


(:action op_2
:parameters (?v11 ?v7 ?v9)
:precondition (and (pred_8 ?v11) (pred_12 ?v7) (pred_12 ?v9)
                  (pred_1 ?v11) (pred_3 ?v9) (pred_5 ?v7 ?v11))
:effect (and (pred_3 ?v7) (pred_5 ?v9 ?v11)
        (not (pred_3 ?v9)) (not (pred_5 ?v7 ?v11))))

(:action op_1
:parameters (?v11 ?v3)
:precondition (and (pred_8 ?v11) (pred_12 ?v3) 
                  (pred_1 ?v11) (pred_3 ?v3))
:effect (and (pred_11 ) (pred_5 ?v3 ?v11) (not (pred_3 ?v3)))))


	
