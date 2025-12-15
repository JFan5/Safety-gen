(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_03 - type_1
obj_08 obj_09 - type_2
obj_05 obj_02 obj_01 obj_10 - type_3
obj_07 obj_04 obj_06 - object)
(:init
(pred_3 obj_03 obj_02)
(pred_2 obj_03 obj_08)
(pred_2 obj_03 obj_09)
(pred_1 obj_07 obj_10)
(pred_1 obj_04 obj_01)
(pred_1 obj_06 obj_05)
)
(:goal
(and
(pred_1 obj_07 obj_01)
(pred_1 obj_04 obj_02)
(pred_1 obj_06 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_03 ?b obj_09))))
)
)