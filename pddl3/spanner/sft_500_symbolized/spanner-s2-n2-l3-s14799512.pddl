; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 14799512 --problem-name spanner-s2-n2-l3-s14799512
(define (problem spanner-s2-n2-l3-s14799512)
 (:domain spanner)
 (:objects 
     obj_06 - type_1
     obj_08 obj_09 - type_4
     obj_05 obj_10 - type_2
     obj_03 obj_01 obj_04 - type_3
     obj_07 obj_02 - type_3
    )
 (:init 
    (pred_6 obj_06 obj_07)
    (pred_6 obj_08 obj_03)
    (pred_1 obj_08)
    (pred_6 obj_09 obj_03)
    (pred_1 obj_09)
    (pred_2 obj_05)
    (pred_6 obj_05 obj_02)
    (pred_2 obj_10)
    (pred_6 obj_10 obj_02)
    (pred_4 obj_07 obj_03)
    (pred_4 obj_04 obj_02)
    (pred_4 obj_03 obj_01)
    (pred_4 obj_01 obj_04)
)
 (:goal
  (and
   (pred_5 obj_05)
   (pred_5 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_05)) (not (pred_5 obj_10))))
    (forall (?m - type_1) (at-most-once (pred_6 ?m obj_07)))
  )
)
)
