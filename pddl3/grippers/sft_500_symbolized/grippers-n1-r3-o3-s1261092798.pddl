(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_09 - type_2
obj_01 obj_05 - type_1
obj_03 obj_08 obj_04 - type_3
obj_06 obj_02 obj_07 - object)
(:init
(pred_4 obj_09 obj_04)
(pred_1 obj_09 obj_01)
(pred_1 obj_09 obj_05)
(pred_3 obj_06 obj_04)
(pred_3 obj_02 obj_08)
(pred_3 obj_07 obj_03)
)
(:goal
(and
(pred_3 obj_06 obj_04)
(pred_3 obj_02 obj_08)
(pred_3 obj_07 obj_04)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_09 ?b obj_05))))
)
)