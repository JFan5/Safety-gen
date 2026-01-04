; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1882528215 --problem-name spanner-s2-n2-l3-s1882528215
(define (problem spanner-s2-n2-l3-s1882528215)
 (:domain spanner)
 (:objects 
     obj_03 - type_2
     obj_10 obj_01 - type_5
     obj_07 obj_04 - type_3
     obj_08 obj_06 obj_09 - type_4
     obj_05 obj_02 - type_4
    )
 (:init 
    (pred_1 obj_03 obj_05)
    (pred_1 obj_10 obj_09)
    (pred_3 obj_10)
    (pred_1 obj_01 obj_09)
    (pred_3 obj_01)
    (pred_4 obj_07)
    (pred_1 obj_07 obj_02)
    (pred_4 obj_04)
    (pred_1 obj_04 obj_02)
    (pred_6 obj_05 obj_08)
    (pred_6 obj_09 obj_02)
    (pred_6 obj_08 obj_06)
    (pred_6 obj_06 obj_09)
)
 (:goal
  (and
   (pred_2 obj_07)
   (pred_2 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_07)) (not (pred_2 obj_04))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_05)))
  )
)
)
