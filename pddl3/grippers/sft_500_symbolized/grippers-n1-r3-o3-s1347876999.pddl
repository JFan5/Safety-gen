(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_03 - type_2
obj_09 obj_01 - type_3
obj_08 obj_07 obj_05 - type_1
obj_06 obj_04 obj_02 - object)
(:init
(pred_2 obj_03 obj_07)
(pred_4 obj_03 obj_09)
(pred_4 obj_03 obj_01)
(pred_1 obj_06 obj_05)
(pred_1 obj_04 obj_05)
(pred_1 obj_02 obj_08)
)
(:goal
(and
(pred_1 obj_06 obj_05)
(pred_1 obj_04 obj_07)
(pred_1 obj_02 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_03 ?b obj_01))))
)
)