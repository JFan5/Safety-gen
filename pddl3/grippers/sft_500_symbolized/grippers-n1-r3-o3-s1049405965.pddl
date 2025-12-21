(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_05 - type_1
obj_07 obj_04 - type_2
obj_09 obj_02 obj_08 - type_3
obj_01 obj_06 obj_03 - object)
(:init
(pred_1 obj_05 obj_09)
(pred_3 obj_05 obj_07)
(pred_3 obj_05 obj_04)
(pred_2 obj_01 obj_02)
(pred_2 obj_06 obj_02)
(pred_2 obj_03 obj_09)
)
(:goal
(and
(pred_2 obj_01 obj_02)
(pred_2 obj_06 obj_09)
(pred_2 obj_03 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_05 ?b obj_07))))
)
)