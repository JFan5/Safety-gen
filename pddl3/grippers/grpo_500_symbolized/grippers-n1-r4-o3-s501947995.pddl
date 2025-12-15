(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_03 - type_1
obj_09 obj_07 - type_3
obj_01 obj_04 obj_05 obj_02 - type_2
obj_10 obj_08 obj_06 - object)
(:init
(pred_3 obj_03 obj_05)
(pred_4 obj_03 obj_09)
(pred_4 obj_03 obj_07)
(pred_2 obj_10 obj_05)
(pred_2 obj_08 obj_02)
(pred_2 obj_06 obj_04)
)
(:goal
(and
(pred_2 obj_10 obj_02)
(pred_2 obj_08 obj_05)
(pred_2 obj_06 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_03 ?b obj_07))))
)
)