(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_06 - type_1
obj_03 obj_07 - type_2
obj_10 obj_09 obj_05 obj_02 - type_3
obj_04 obj_08 obj_01 - object)
(:init
(pred_3 obj_06 obj_09)
(pred_2 obj_06 obj_03)
(pred_2 obj_06 obj_07)
(pred_1 obj_04 obj_10)
(pred_1 obj_08 obj_05)
(pred_1 obj_01 obj_02)
)
(:goal
(and
(pred_1 obj_04 obj_09)
(pred_1 obj_08 obj_09)
(pred_1 obj_01 obj_10)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_06 ?b obj_07))))
)
)