; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1935332827 --problem-name spanner-s2-n2-l3-s1935332827
(define (problem spanner-s2-n2-l3-s1935332827)
 (:domain spanner)
 (:objects 
     obj_09 - type_5
     obj_04 obj_02 - type_2
     obj_07 obj_03 - type_1
     obj_08 obj_06 obj_01 - type_3
     obj_05 obj_10 - type_3
    )
 (:init 
    (pred_4 obj_09 obj_05)
    (pred_4 obj_04 obj_01)
    (pred_1 obj_04)
    (pred_4 obj_02 obj_06)
    (pred_1 obj_02)
    (pred_6 obj_07)
    (pred_4 obj_07 obj_10)
    (pred_6 obj_03)
    (pred_4 obj_03 obj_10)
    (pred_5 obj_05 obj_08)
    (pred_5 obj_01 obj_10)
    (pred_5 obj_08 obj_06)
    (pred_5 obj_06 obj_01)
)
 (:goal
  (and
   (pred_3 obj_07)
   (pred_3 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_07)) (not (pred_3 obj_03))))
    (forall (?m - type_5) (at-most-once (pred_4 ?m obj_05)))
  )
)
)
