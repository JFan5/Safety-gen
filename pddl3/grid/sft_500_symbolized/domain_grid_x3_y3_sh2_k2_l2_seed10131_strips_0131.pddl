(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v1 ?v3)
             (pred_2 ?v10 ?v6)
             (pred_11 ?v1 ?v6)
             (pred_7 ?v4 ?v1 )
	     (pred_6 ?v1)
             (pred_1 ?v12)
             (pred_10 ?v10)
             (pred_12 ?v6)
             (pred_5 ?v1)
             (pred_3 ?v10)
             (pred_4 ?v1)
             (pred_8 ))



(:action op_4
:parameters (?v11 ?v13 ?v2 ?v7)
:precondition (and (pred_1 ?v11) (pred_1 ?v13) (pred_10 ?v2) (pred_12 ?v7)
          (pred_9 ?v11 ?v13) (pred_2 ?v2 ?v7)
                   (pred_11 ?v13 ?v7) (pred_6 ?v11) 
                   (pred_5 ?v13) (pred_3 ?v2))
:effect (and  (pred_4 ?v13) (not (pred_5 ?v13))))


(:action op_1
:parameters (?v11 ?v5)
:precondition (and (pred_1 ?v11) (pred_1 ?v5)
               (pred_6 ?v11) (pred_9 ?v11 ?v5) (pred_4 ?v5))
:effect (and (pred_6 ?v5) (not (pred_6 ?v11))))

(:action op_5
:parameters (?v11 ?v2)
:precondition (and (pred_1 ?v11) (pred_10 ?v2) 
                  (pred_6 ?v11) (pred_7 ?v2 ?v11) (pred_8 ))
:effect (and (pred_3 ?v2)
   (not (pred_7 ?v2 ?v11)) (not (pred_8 ))))


(:action op_3
:parameters (?v11 ?v8 ?v9)
:precondition (and (pred_1 ?v11) (pred_10 ?v8) (pred_10 ?v9)
                  (pred_6 ?v11) (pred_3 ?v9) (pred_7 ?v8 ?v11))
:effect (and (pred_3 ?v8) (pred_7 ?v9 ?v11)
        (not (pred_3 ?v9)) (not (pred_7 ?v8 ?v11))))

(:action op_2
:parameters (?v11 ?v2)
:precondition (and (pred_1 ?v11) (pred_10 ?v2) 
                  (pred_6 ?v11) (pred_3 ?v2))
:effect (and (pred_8 ) (pred_7 ?v2 ?v11) (not (pred_3 ?v2)))))


	
