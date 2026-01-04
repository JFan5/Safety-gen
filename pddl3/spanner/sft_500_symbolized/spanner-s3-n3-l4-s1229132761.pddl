; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1229132761 --problem-name spanner-s3-n3-l4-s1229132761
(define (problem spanner-s3-n3-l4-s1229132761)
 (:domain spanner)
 (:objects 
     obj_11 - type_5
     obj_10 obj_12 obj_03 - type_2
     obj_09 obj_02 obj_05 - type_3
     obj_13 obj_08 obj_01 obj_04 - type_1
     obj_07 obj_06 - type_1
    )
 (:init 
    (pred_1 obj_11 obj_07)
    (pred_1 obj_10 obj_01)
    (pred_5 obj_10)
    (pred_1 obj_12 obj_01)
    (pred_5 obj_12)
    (pred_1 obj_03 obj_13)
    (pred_5 obj_03)
    (pred_2 obj_09)
    (pred_1 obj_09 obj_06)
    (pred_2 obj_02)
    (pred_1 obj_02 obj_06)
    (pred_2 obj_05)
    (pred_1 obj_05 obj_06)
    (pred_3 obj_07 obj_13)
    (pred_3 obj_04 obj_06)
    (pred_3 obj_13 obj_08)
    (pred_3 obj_08 obj_01)
    (pred_3 obj_01 obj_04)
)
 (:goal
  (and
   (pred_4 obj_09)
   (pred_4 obj_02)
   (pred_4 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_02)) (not (pred_4 obj_05))))
    (forall (?m - type_5) (at-most-once (pred_1 ?m obj_07)))
  )
)
)
