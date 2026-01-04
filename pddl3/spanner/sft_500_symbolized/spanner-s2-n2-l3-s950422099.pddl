; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 950422099 --problem-name spanner-s2-n2-l3-s950422099
(define (problem spanner-s2-n2-l3-s950422099)
 (:domain spanner)
 (:objects 
     obj_04 - type_3
     obj_02 obj_03 - type_2
     obj_10 obj_08 - type_4
     obj_07 obj_01 obj_05 - type_1
     obj_06 obj_09 - type_1
    )
 (:init 
    (pred_5 obj_04 obj_06)
    (pred_5 obj_02 obj_01)
    (pred_2 obj_02)
    (pred_5 obj_03 obj_01)
    (pred_2 obj_03)
    (pred_3 obj_10)
    (pred_5 obj_10 obj_09)
    (pred_3 obj_08)
    (pred_5 obj_08 obj_09)
    (pred_4 obj_06 obj_07)
    (pred_4 obj_05 obj_09)
    (pred_4 obj_07 obj_01)
    (pred_4 obj_01 obj_05)
)
 (:goal
  (and
   (pred_1 obj_10)
   (pred_1 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_10)) (not (pred_1 obj_08))))
    (forall (?m - type_3) (at-most-once (pred_5 ?m obj_06)))
  )
)
)
