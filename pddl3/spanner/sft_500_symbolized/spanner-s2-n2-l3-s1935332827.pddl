; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1935332827 --problem-name spanner-s2-n2-l3-s1935332827
(define (problem spanner-s2-n2-l3-s1935332827)
 (:domain spanner)
 (:objects 
     obj_08 - type_1
     obj_10 obj_05 - type_5
     obj_07 obj_01 - type_4
     obj_02 obj_03 obj_04 - type_3
     obj_09 obj_06 - type_3
    )
 (:init 
    (pred_6 obj_08 obj_09)
    (pred_6 obj_10 obj_04)
    (pred_3 obj_10)
    (pred_6 obj_05 obj_03)
    (pred_3 obj_05)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_06)
    (pred_4 obj_01)
    (pred_6 obj_01 obj_06)
    (pred_5 obj_09 obj_02)
    (pred_5 obj_04 obj_06)
    (pred_5 obj_02 obj_03)
    (pred_5 obj_03 obj_04)
)
 (:goal
  (and
   (pred_1 obj_07)
   (pred_1 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_07)) (not (pred_1 obj_01))))
    (forall (?m - type_1) (at-most-once (pred_6 ?m obj_09)))
  )
)
)
