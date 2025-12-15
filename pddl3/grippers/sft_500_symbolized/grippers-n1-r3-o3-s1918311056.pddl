(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_06 - type_1
obj_01 obj_07 - type_3
obj_05 obj_08 obj_09 - type_2
obj_02 obj_04 obj_03 - object)
(:init
(pred_4 obj_06 obj_09)
(pred_3 obj_06 obj_01)
(pred_3 obj_06 obj_07)
(pred_1 obj_02 obj_08)
(pred_1 obj_04 obj_09)
(pred_1 obj_03 obj_05)
)
(:goal
(and
(pred_1 obj_02 obj_09)
(pred_1 obj_04 obj_05)
(pred_1 obj_03 obj_08)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_06 ?b obj_07))))
)
)