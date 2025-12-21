(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_06 - type_1
obj_09 obj_04 - type_2
obj_07 obj_05 obj_02 - type_3
obj_03 obj_08 obj_01 - object)
(:init
(pred_1 obj_06 obj_05)
(pred_3 obj_06 obj_09)
(pred_3 obj_06 obj_04)
(pred_2 obj_03 obj_07)
(pred_2 obj_08 obj_07)
(pred_2 obj_01 obj_05)
)
(:goal
(and
(pred_2 obj_03 obj_02)
(pred_2 obj_08 obj_05)
(pred_2 obj_01 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_06 ?b obj_04))))
)
)