(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_01 - type_1
obj_02 obj_03 - type_3
obj_06 obj_09 obj_05 - type_2
obj_04 obj_07 obj_08 - object)
(:init
(pred_3 obj_01 obj_05)
(pred_1 obj_01 obj_02)
(pred_1 obj_01 obj_03)
(pred_2 obj_04 obj_05)
(pred_2 obj_07 obj_05)
(pred_2 obj_08 obj_05)
)
(:goal
(and
(pred_2 obj_04 obj_05)
(pred_2 obj_07 obj_05)
(pred_2 obj_08 obj_06)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_01 ?b obj_03))))
)
)