(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_06 - type_2
obj_05 obj_10 - type_3
obj_03 obj_08 obj_02 obj_07 - type_1
obj_01 obj_09 obj_04 - object)
(:init
(pred_2 obj_06 obj_02)
(pred_1 obj_06 obj_05)
(pred_1 obj_06 obj_10)
(pred_4 obj_01 obj_03)
(pred_4 obj_09 obj_08)
(pred_4 obj_04 obj_07)
)
(:goal
(and
(pred_4 obj_01 obj_02)
(pred_4 obj_09 obj_07)
(pred_4 obj_04 obj_03)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_06 ?b obj_10))))
)
)