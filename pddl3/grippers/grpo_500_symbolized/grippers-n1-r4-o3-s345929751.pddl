(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_07 - type_1
obj_04 obj_05 - type_3
obj_02 obj_10 obj_09 obj_08 - type_2
obj_06 obj_01 obj_03 - object)
(:init
(pred_4 obj_07 obj_08)
(pred_2 obj_07 obj_04)
(pred_2 obj_07 obj_05)
(pred_3 obj_06 obj_02)
(pred_3 obj_01 obj_02)
(pred_3 obj_03 obj_02)
)
(:goal
(and
(pred_3 obj_06 obj_02)
(pred_3 obj_01 obj_08)
(pred_3 obj_03 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_07 ?b obj_05))))
)
)