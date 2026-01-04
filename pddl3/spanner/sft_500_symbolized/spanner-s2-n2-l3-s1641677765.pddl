; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1641677765 --problem-name spanner-s2-n2-l3-s1641677765
(define (problem spanner-s2-n2-l3-s1641677765)
 (:domain spanner)
 (:objects 
     obj_04 - type_1
     obj_05 obj_08 - type_5
     obj_02 obj_09 - type_2
     obj_10 obj_01 obj_06 - type_3
     obj_03 obj_07 - type_3
    )
 (:init 
    (pred_1 obj_04 obj_03)
    (pred_1 obj_05 obj_06)
    (pred_2 obj_05)
    (pred_1 obj_08 obj_01)
    (pred_2 obj_08)
    (pred_4 obj_02)
    (pred_1 obj_02 obj_07)
    (pred_4 obj_09)
    (pred_1 obj_09 obj_07)
    (pred_3 obj_03 obj_10)
    (pred_3 obj_06 obj_07)
    (pred_3 obj_10 obj_01)
    (pred_3 obj_01 obj_06)
)
 (:goal
  (and
   (pred_5 obj_02)
   (pred_5 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_02)) (not (pred_5 obj_09))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_03)))
  )
)
)
