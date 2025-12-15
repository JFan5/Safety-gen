(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_06 - type_1
obj_07 obj_04 - type_3
obj_02 obj_03 obj_08 obj_01 - type_2
obj_05 obj_09 obj_10 - object)
(:init
(pred_3 obj_06 obj_01)
(pred_4 obj_06 obj_07)
(pred_4 obj_06 obj_04)
(pred_2 obj_05 obj_01)
(pred_2 obj_09 obj_02)
(pred_2 obj_10 obj_03)
)
(:goal
(and
(pred_2 obj_05 obj_03)
(pred_2 obj_09 obj_08)
(pred_2 obj_10 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_06 ?b obj_04))))
)
)