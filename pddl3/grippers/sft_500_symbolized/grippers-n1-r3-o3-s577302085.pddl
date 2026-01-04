(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_01 - type_1
obj_05 obj_02 - type_2
obj_07 obj_08 obj_03 - type_3
obj_09 obj_06 obj_04 - object)
(:init
(pred_4 obj_01 obj_07)
(pred_3 obj_01 obj_05)
(pred_3 obj_01 obj_02)
(pred_1 obj_09 obj_07)
(pred_1 obj_06 obj_08)
(pred_1 obj_04 obj_07)
)
(:goal
(and
(pred_1 obj_09 obj_08)
(pred_1 obj_06 obj_08)
(pred_1 obj_04 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_01 ?b obj_02))))
)
)