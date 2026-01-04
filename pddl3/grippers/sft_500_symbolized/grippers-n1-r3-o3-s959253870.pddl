(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_09 - type_2
obj_07 obj_04 - type_1
obj_08 obj_03 obj_01 - type_3
obj_06 obj_02 obj_05 - object)
(:init
(pred_4 obj_09 obj_01)
(pred_1 obj_09 obj_07)
(pred_1 obj_09 obj_04)
(pred_3 obj_06 obj_03)
(pred_3 obj_02 obj_01)
(pred_3 obj_05 obj_03)
)
(:goal
(and
(pred_3 obj_06 obj_03)
(pred_3 obj_02 obj_01)
(pred_3 obj_05 obj_08)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_09 ?b obj_04))))
)
)