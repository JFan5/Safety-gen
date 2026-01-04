(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_06 - type_3
obj_05 obj_09 - type_1
obj_02 obj_04 obj_01 - type_2
obj_03 obj_08 obj_07 - object)
(:init
(pred_1 obj_06 obj_04)
(pred_3 obj_06 obj_05)
(pred_3 obj_06 obj_09)
(pred_4 obj_03 obj_02)
(pred_4 obj_08 obj_02)
(pred_4 obj_07 obj_01)
)
(:goal
(and
(pred_4 obj_03 obj_01)
(pred_4 obj_08 obj_04)
(pred_4 obj_07 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_06 ?b obj_09))))
)
)