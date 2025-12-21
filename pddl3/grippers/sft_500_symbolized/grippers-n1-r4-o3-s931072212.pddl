(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_08 - type_1
obj_04 obj_02 - type_2
obj_10 obj_05 obj_07 obj_03 - type_3
obj_01 obj_09 obj_06 - object)
(:init
(pred_1 obj_08 obj_03)
(pred_3 obj_08 obj_04)
(pred_3 obj_08 obj_02)
(pred_2 obj_01 obj_05)
(pred_2 obj_09 obj_03)
(pred_2 obj_06 obj_05)
)
(:goal
(and
(pred_2 obj_01 obj_05)
(pred_2 obj_09 obj_05)
(pred_2 obj_06 obj_10)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_08 ?b obj_02))))
)
)