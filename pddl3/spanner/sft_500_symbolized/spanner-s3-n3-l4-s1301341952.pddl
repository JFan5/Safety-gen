; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1301341952 --problem-name spanner-s3-n3-l4-s1301341952
(define (problem spanner-s3-n3-l4-s1301341952)
 (:domain spanner)
 (:objects 
     obj_13 - type_2
     obj_04 obj_08 obj_02 - type_4
     obj_10 obj_11 obj_01 - type_1
     obj_12 obj_06 obj_09 obj_05 - type_5
     obj_03 obj_07 - type_5
    )
 (:init 
    (pred_2 obj_13 obj_03)
    (pred_2 obj_04 obj_06)
    (pred_3 obj_04)
    (pred_2 obj_08 obj_06)
    (pred_3 obj_08)
    (pred_2 obj_02 obj_06)
    (pred_3 obj_02)
    (pred_4 obj_10)
    (pred_2 obj_10 obj_07)
    (pred_4 obj_11)
    (pred_2 obj_11 obj_07)
    (pred_4 obj_01)
    (pred_2 obj_01 obj_07)
    (pred_5 obj_03 obj_12)
    (pred_5 obj_05 obj_07)
    (pred_5 obj_12 obj_06)
    (pred_5 obj_06 obj_09)
    (pred_5 obj_09 obj_05)
)
 (:goal
  (and
   (pred_1 obj_10)
   (pred_1 obj_11)
   (pred_1 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_10)) (not (pred_1 obj_11))))
    (forall (?m - type_2) (at-most-once (pred_2 ?m obj_03)))
  )
)
)
